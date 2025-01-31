import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/res/components/common_text.dart';
import 'package:store_app/view/cart/cart_view.dart';
import 'package:store_app/view/home/components/common_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<dynamic> products = [];

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        products = data;
      });
      print(data);
    } else {
      print('Failed to load data');
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => CartView(
                          title: products[index]['title'],
                          price: products[index]['price']!.toString(),
                        ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
