import 'package:flutter/material.dart';

import '../../../../core/shared/styles.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({super.key, required this.colorName});
  final String colorName;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          width: 90,
          height: 60,
          decoration: BoxDecoration(
              color: colorName == "Red"
                  ? Colors.red
                  : colorName == "Grey"
                      ? Colors.grey
                      : colorName == "Black"
                          ? Colors.black
                          : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: colorName == "White" ? Colors.black : Colors.white,
                  width: 2)),
          child: Center(
            child: Text(
              colorName,
              style: Styles.textStyle18.copyWith(
                color: colorName == "White" ? Colors.black : Colors.white,
              ),
            ),
          ),
        ));
  }
}
