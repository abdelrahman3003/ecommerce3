import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: Styles.textStyle25
            .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
