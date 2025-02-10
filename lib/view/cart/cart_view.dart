import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/model/cart_item.dart';
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/view/cart/components/common_card_cart.dart';
import 'package:store_app/view_model/cart_viewmodel.dart';

class CartView extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartView({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartViewmodel()..setCartItems(cartItems),
      child: Consumer<CartViewmodel>(
        builder: (context, viewModel, child) {
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
                    itemCount: viewModel.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = viewModel.cartItems[index];
                      return CommonCardCart(
                        image: Image.network(item.image, height: 150),
                        title: item.title,
                        price: 'Rs ${item.price.toStringAsFixed(2)}',
                        quantity: item.quantity,
                        onQuantityChanged: (newQuantity) {
                          viewModel.updateQuantity(index, newQuantity);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Total: Rs ${viewModel.totalprice.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
