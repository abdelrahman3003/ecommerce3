import 'package:flutter/material.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/constatns_value.dart';

class IconAppbar extends StatelessWidget {
  const IconAppbar({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kborderradius),
            color: ColorsApp.kprimaryColor3),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 30,
            color: Colors.grey,
          ),
        ));
  }
}
