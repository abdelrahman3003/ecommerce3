import 'package:flutter/material.dart';

class IconAuth extends StatelessWidget {
  const IconAuth({
    super.key,
    required this.icon,
    required this.onTap,
  });
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
            color: Colors.white),
        child: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
    );
  }
}
