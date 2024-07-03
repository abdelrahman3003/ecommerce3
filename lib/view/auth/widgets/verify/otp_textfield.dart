import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/verify_code.dart';

class AppOtpTextField extends GetView<VerifyCodeController> {
  const AppOtpTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      borderWidth: 2,
      numberOfFields: 5,
      borderColor: Color(0xFF512DA8),
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        controller.verifycode(verificationCode);
      }, // end onSubmit
    );
  }
}
