import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  const DividerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.black,
              height: 1.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Or sign in with',
              style: Styles.textStyle16,
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.black,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
