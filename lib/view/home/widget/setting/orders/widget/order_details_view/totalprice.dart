import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../controller/setting/order_details_controller.dart';
import '../../../../../../../core/shared/styles.dart';

class TotalPrice extends GetView<OrderDetailsControllerImp> {
  const TotalPrice({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Total Price  :  ",
            style:
                Styles.textStyle20black.copyWith(fontWeight: FontWeight.bold)),
        Opacity(
          opacity: .6,
          child: Text("${controller.orderModel!.totalprice} \$",
              style: Styles.textStyle20black
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
