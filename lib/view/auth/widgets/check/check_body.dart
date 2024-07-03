import 'package:eccommerce4/view/auth/widgets/check/check_form.dart';
import 'package:flutter/material.dart';
import '../textsection.dart';

class CheckBody extends StatelessWidget {
  const CheckBody({
    super.key,
    required this.title,
    required this.titlebold,
    required this.subtitle,
  });
  final String title;
  final String titlebold;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(height: 30),
          TextsSections(title: title),
          TextsSections(
            titlebold: titlebold,
            subtitle: subtitle,
          ),
          const SizedBox(height: 30),
          const CheckForm(),
        ],
      ),
    );
  }
}
