import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

class TextsSections extends StatelessWidget {
  const TextsSections(
      {super.key, this.title = "", this.subtitle = "", this.titlebold = ""});
  final String title;
  final String titlebold;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titlebold,
          style: Styles.textStyle30.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          title,
          style: Styles.textStyle26,
        ),
        Opacity(
          opacity: .8,
          child: Text(
            subtitle,
            style: Styles.textStyle16,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
