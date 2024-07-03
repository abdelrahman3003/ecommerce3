import 'package:eccommerce4/core/shared/styles.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
      required this.tilte,
      required this.subtitle,
      required this.date});
  final String tilte;
  final String subtitle;
  final String date;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(children: [
          Text(tilte,
              style: Styles.textStyle25black
                  .copyWith(fontWeight: FontWeight.normal)),
          const Spacer(),
          Text(date,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.normal))
        ]),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(subtitle,
              style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.normal, color: Colors.black)),
        ));
  }
}
