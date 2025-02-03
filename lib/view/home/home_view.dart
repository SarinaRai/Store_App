import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/view/cart/cart_view.dart';
import 'package:store_app/view/home/components/common_card.dart';
import 'package:store_app/model/cart_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<dynamic> products = [];
  List<CartItem> cartItems = [];

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (mounted) {
        setState(() {
          products = data;
        });
      }
    } else {
      print('Failed to load data');
    }
  }

  void _addToCart(String title, double price) {
    final existingItemIndex = cartItems.indexWhere(
      (item) => item.title == title,
    );
    if (existingItemIndex >= 0) {
      setState(() {
        cartItems[existingItemIndex].quantity += 1;
      });
    } else {
      setState(() {
        cartItems.add(CartItem(title: title, price: price));
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  builder: (context) => CartView(cartItems: cartItems),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: Text(
                '${cartItems.length}',
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
          itemCount: products.length,
          itemBuilder: (context, index) {
            return CommonCard(
              image: Image.network(products[index]['image'], height: 150),
              title: products[index]['title'],
              price: 'Rs ${products[index]['price']?.toString()}',
              buttonText: 'Add to Cart',
              onPressed: () {
                _addToCart(
                  products[index]['title'],
                  products[index]['price'].toDouble(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
