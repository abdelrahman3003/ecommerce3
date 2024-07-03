import 'package:eccommerce4/controller/auth/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';
import '../authfield.dart';

class RestpasswordForm extends StatefulWidget {
  const RestpasswordForm({
    super.key,
  });

  @override
  State<RestpasswordForm> createState() => _ForgetpasswordFormState();
}

class _ForgetpasswordFormState extends State<RestpasswordForm> {
  late String email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String newPassword;
  late String retypePassword;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        const SizedBox(height: 30),
        AuthField(
            onsave: (value) {
              newPassword = value!;
            },
            validator: (val) {
              return validation(type: "Password", val: val!);
            },
            icon: Icons.password,
            text: "New password"),
        const SizedBox(height: 10),
        AuthField(
            onsave: (value) {
              retypePassword = value!;
            },
            validator: (val) {
              return validation(type: "Password", val: val!);
            },
            icon: Icons.password,
            text: "Retype password"),
        const SizedBox(height: 25),
        GetBuilder<ResetPasswordController>(
          builder: (controller) => OnboardingButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                controller.resetpassword(newPassword, retypePassword);
              }
            },
            text: "Confirm",
          ),
        )
      ]),
    );
  }
}
