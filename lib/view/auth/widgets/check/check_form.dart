import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/check_email_controller.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';
import '../authfield.dart';

class CheckForm extends StatefulWidget {
  const CheckForm({
    super.key,
  });

  @override
  State<CheckForm> createState() => _CheckFormState();
}

class _CheckFormState extends State<CheckForm> {
  String? email;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        const SizedBox(height: 10),
        AuthField(
          icon: Icons.email,
          text: "Email",
          onsave: (value) {
            email = value!;
          },
          validator: (val) {
            return validation(type: "Email", val: val!);
          },
        ),
        const SizedBox(height: 25),
        GetBuilder<CheckEmailController>(
          builder: (controller) {
            return OnboardingButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  controller.checkemail(email!);
                }
              },
              text: "Check Email",
            );
          },
        )
      ]),
    );
  }
}
