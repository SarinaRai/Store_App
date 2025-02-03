import 'package:flutter/material.dart';
import 'package:store_app/model/cart_item.dart';
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/view/cart/components/common_card_cart.dart';

class CartView extends StatefulWidget {
  final List<CartItem> cartItems;

  CartView({super.key, required this.cartItems});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  void _updateQuantity(int index, int newQuantity) {
    setState(() {
      if (newQuantity == 0) {
        widget.cartItems.removeAt(index);
      } else {
        widget.cartItems[index].quantity = newQuantity;
      }
    });
  }

  double get _totalprice {
    return widget.cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: CommonText(
          text: 'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return CommonCardCart(
                  title: item.title,
                  price: 'Rs ${item.price.toStringAsFixed(2)}',
                  quantity: item.quantity,
                  onQuantityChanged: (newQuantity) {
                    _updateQuantity(index, newQuantity);
                  },
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Total: Rs ${_totalprice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
