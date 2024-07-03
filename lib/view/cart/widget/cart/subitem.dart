import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

class Subitem extends StatelessWidget {
  const Subitem({super.key, required this.totalprice});
  final String totalprice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text("Shopping",
                style:
                    Styles.textStyle18.copyWith(fontWeight: FontWeight.bold))),
        Text("\$ $totalprice",
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
