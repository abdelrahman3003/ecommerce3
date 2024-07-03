import 'package:eccommerce4/controller/auth/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/showpassword.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';
import '../authfield.dart';
import 'forget_password_text.dart';

class LoginSectionFields extends StatefulWidget {
  const LoginSectionFields({
    super.key,
  });

  @override
  State<LoginSectionFields> createState() => _LoginSectionFieldsState();
}

class _LoginSectionFieldsState extends State<LoginSectionFields> {
  late String email;
  late String password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
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
        const SizedBox(height: 20),
        GetBuilder<Showpassordcontroller>(
          builder: (controller) => Stack(
            children: [
              AuthField(
                onsave: (value) {
                  password = value!;
                },
                validator: (val) {
                  return validation(type: "Password", val: val!);
                },
                icon: Icons.password,
                text: "Password",
                obscureText: controller.isShowpassword,
              ),
              Positioned(
                  right: 5,
                  bottom: 10,
                  child: GetBuilder<Showpassordcontroller>(
                    builder: (controller) => IconButton(
                      onPressed: () {
                        controller.showpassword();
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: ColorsApp.kprimaryColor1,
                        size: 25,
                      ),
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.bottomLeft,
          child: ForgetPasswordText(),
        ),
        const SizedBox(height: 10),
        GetBuilder<SigninController>(
          builder: (controller) => OnboardingButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                controller.signin(email, password);
              }
            },
            text: "Login",
          ),
        ),
        const SizedBox(height: 20),
      ]),
    );
  }
}
