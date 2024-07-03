import 'package:eccommerce4/view/auth/widgets/iconauth.dart';
import 'package:eccommerce4/view/auth/widgets/textfiledauth.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    required this.text,
    required this.icon,
    required this.onsave,
    this.onTap,
    this.validator,
    this.isnumber = false,
    this.obscureText = false,
  });
  final String text;
  final IconData icon;
  final void Function(String?) onsave;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final bool isnumber;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      TextfieldAuth(
        obscureText: obscureText,
        isnumber: isnumber,
        onsave: onsave,
        text: text,
        validator: validator,
      ),
      Positioned(
        left: .5,
        top: -10,
        child: IconAuth(
          icon: icon,
          onTap: onTap,
        ),
      )
    ]);
  }
}
