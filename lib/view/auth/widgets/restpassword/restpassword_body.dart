import 'package:flutter/material.dart';
import '../textsection.dart';
import 'resetpassword_form.dart';

class ResetpasswordBody extends StatelessWidget {
  const ResetpasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30),
            TextsSections(
              title: "Reset password",
            ),
            TextsSections(
                titlebold: "New password ",
                subtitle: "Please enter new password"),
            RestpasswordForm(),
          ],
        ),
      ),
    );
  }
}
