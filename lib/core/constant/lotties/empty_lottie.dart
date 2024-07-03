import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyLottie extends StatelessWidget {
  const EmptyLottie({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset("assets/lotties/empty.json"),
        Text("No Data Found",
            style: Styles.textStyle25.copyWith(color: Colors.black)),
      ],
    );
  }
}
