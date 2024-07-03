import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

import 'color_container.dart';

class ItemColors extends StatelessWidget {
  const ItemColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: Styles.textStyle25
              .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            ColorContainer(colorName: "White"),
            ColorContainer(colorName: "Grey"),
            ColorContainer(colorName: "Black")
          ],
        )
      ],
    );
  }
}
