import 'package:flutter/material.dart';

import '../../../../../core/shared/styles.dart';

class SettinItemCard extends StatelessWidget {
  const SettinItemCard(
      {super.key, this.onTap, required this.title, required this.icon});
  final Function()? onTap;
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListTile(
          onTap: onTap,
          title: Text(title,
              style: Styles.textStyle25.copyWith(
                  color: title == "Logout" ? Colors.red : Colors.black)),
          trailing: Icon(icon, size: 35)),
    );
  }
}
