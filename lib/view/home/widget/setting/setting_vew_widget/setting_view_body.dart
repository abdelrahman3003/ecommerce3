import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'background.dart';
import 'setting_listtile.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Background(),
        SizedBox(height: Get.width / 5),
        const SeetingListTile(),
      ],
    );
  }
}
