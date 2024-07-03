import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

class ItemDes extends StatelessWidget {
  const ItemDes({super.key, required this.des});
  final String des;
  @override
  Widget build(BuildContext context) {
    return Text(
      des,
      style: Styles.textStyle16.copyWith(color: Colors.black),
    );
  }
}
