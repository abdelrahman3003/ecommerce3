import 'package:flutter/material.dart';

import '../../../../../../../core/shared/styles.dart';

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.tilte, required this.subtilte});
  final String tilte;
  final String subtilte;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$tilte : ",
            style: Styles.textStyle25black.copyWith(
              fontSize: tilte == "Order Number" ? 25 : 20,
              fontWeight:
                  tilte == "Order Number" ? FontWeight.bold : FontWeight.w500,
            )),
        Text(subtilte,
            style: Styles.textStyle20black.copyWith(
                fontSize: tilte == "Order Number" ? 25 : 18,
                fontWeight: tilte == "Order Status"
                    ? FontWeight.bold
                    : FontWeight.normal)),
      ],
    );
  }
}
