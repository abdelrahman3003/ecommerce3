import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'success_section.dart';
import 'successbuttton.dart';

class SuccessBody extends StatelessWidget {
  const SuccessBody(
      {super.key, this.successtext = "", this.title = "", this.subtitle = ""});
  final String successtext;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Get.height * .06),
        SuccessSection(
            subtitle: subtitle, title: title, successtext: successtext),
        const Spacer(),
        const SuccessButton(),
        SizedBox(height: Get.height * .04)
      ],
    );
  }
}
