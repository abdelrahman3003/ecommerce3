import 'package:eccommerce4/view/auth/widgets/verify/otp_textfield.dart';
import 'package:flutter/material.dart';
import '../textsection.dart';
import 'rensed_verifycode.dart';

class VerfiyBody extends StatelessWidget {
  const VerfiyBody({
    super.key,
    required this.titlebold,
    required this.title,
    required this.subtitle,
  });
  final String titlebold;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 30),
          TextsSections(title: title),
          const SizedBox(height: 20),
          TextsSections(titlebold: titlebold, subtitle: subtitle),
          const AppOtpTextField(),
          const SizedBox(height: 20),
          const ResnedVerifyCode(),
        ],
      ),
    );
  }
}
