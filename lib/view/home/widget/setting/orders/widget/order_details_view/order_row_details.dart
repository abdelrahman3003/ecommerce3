import 'package:flutter/material.dart';
import 'text_item_oreder_card.dart';

class OrderDetailsRow extends StatelessWidget {
  const OrderDetailsRow(
      {super.key, required this.item, required this.qty, required this.price});
  final String item;
  final String qty;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            TextItemOrderCard(title: item),
            TextItemOrderCard(title: qty),
            TextItemOrderCard(title: price)
          ],
        )
      ],
    );
  }
}
