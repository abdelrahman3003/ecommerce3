import 'package:eccommerce4/data/model/cart_model.dart';
import 'package:flutter/material.dart';

import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItemsList});
  final List<CartModel> cartItemsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: cartItemsList.length,
        itemBuilder: (context, index) => CartItem(index: index));
  }
}
