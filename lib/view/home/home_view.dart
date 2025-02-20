import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/view/cart/cart_view.dart';
import 'package:store_app/view/home/components/common_card.dart';
import 'package:store_app/view_model/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) =>
              HomeViewmodel()
                ..fetchProduct()
                ..loadCartItems(),
      child: Consumer<HomeViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: CommonText(
                text: 'Store App',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              actions: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                CartView(cartItems: viewModel.cartItems),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Center(
                    child: Text(
                      '${viewModel.cartItems.length}',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.58,
                ),
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  final product = viewModel.products[index];
                  return CommonCard(
                    image: Image.network(product.image ?? '', height: 150),
                    title: product.title ?? '',
                    price: 'Rs ${product.price?.toString()}',
                    buttonText: 'Add to Cart',
                    onPressed: () {
                      viewModel.addToCart(
                        product.title ?? '',
                        product.price ?? '',
                        product.image ?? '',
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
