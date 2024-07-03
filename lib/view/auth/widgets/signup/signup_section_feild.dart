import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/showpassword.dart';
import '../../../../controller/auth/signup_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/validation.dart';
import '../../../../core/shared/widgets/buttons/onboarding_Button.dart';
import '../authfield.dart';

class SignupSectionFields extends StatefulWidget {
  const SignupSectionFields({
    super.key,
  });

  @override
  State<SignupSectionFields> createState() => _SignupSectionFieldsState();
}

class _SignupSectionFieldsState extends State<SignupSectionFields> {
  late String username;
  late String email;
  late String password;
  late String phone;
  File? file;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AuthField(
            icon: Icons.person,
            text: "Username",
            onsave: (value) {
              username = value!;
            },
            validator: (val) {
              return validation(type: "Username", val: val!);
            },
          ),
          const SizedBox(height: 20),
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
          AuthField(
            icon: Icons.phone,
            text: "Phone",
            isnumber: true,
            onsave: (value) {
              phone = value!;
            },
            validator: (val) {
              return validation(type: "Phone", val: val!);
            },
          ),
          const SizedBox(height: 20),
          GetBuilder<Showpassordcontroller>(
            builder: (controller) => Stack(children: [
              AuthField(
                icon: Icons.password,
                text: "Password",
                onsave: (value) {
                  password = value!;
                },
                validator: (val) {
                  return validation(type: "Password", val: val!);
                },
                obscureText: controller.isShowpassword,
              ),
              Positioned(
                right: 5,
                bottom: 10,
                child: IconButton(
                  onPressed: () {
                    controller.showpassword();
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: ColorsApp.kprimaryColor1,
                    size: 25,
                  ),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 20),
          GetBuilder<SignupController>(
              builder: (controller) => OnboardingButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await controller.signup(username, email, phone, password);
                    }
                  },
                  text: "Signup")),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
