import 'package:eccommerce4/core/constant/routsApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';
import '../authfield.dart';

class VerifyForm extends StatefulWidget {
  const VerifyForm({
    super.key,
  });

  @override
  State<VerifyForm> createState() => _ForgetpasswordFormState();
}

class _ForgetpasswordFormState extends State<VerifyForm> {
  late String code;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        const SizedBox(height: 10),
        AuthField(
            onsave: (value) {
              code = value!;
            },
            icon: Icons.email,
            text: "Code"),
        const SizedBox(height: 25),
        OnboardingButton(
          onPressed: () {
            Get.toNamed(kRestPassword);
          },
          text: "Verify",
        ),
      ]),
    );
  }
}
