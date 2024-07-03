import 'package:flutter/material.dart';

import 'widget/items_view/item_view_body.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ItemsViewBody(),
      )),
    );
  }
}
