import 'package:flutter/material.dart';
import 'package:store_app/view/cart/components/common_card_cart.dart';

class CartView extends StatelessWidget {
  final String title;
  final String price;
  const CartView({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CommonCardCart(title: title, price: price));
  }
}
