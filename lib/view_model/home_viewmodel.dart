import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/model/cart_item.dart';

class HomeViewmodel extends ChangeNotifier {
  List<dynamic> _products = [];
  List<CartItem> _cartItems = [];
  static final String _cartItemsKey = 'cartItems';
  List<dynamic> get products => _products;
  List<CartItem> get cartItems => _cartItems;

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      _products = json.decode(response.body);
      notifyListeners();
    } else {
      print('Failed to load the data');
    }
  }

  Future<void> loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartItemsJson = prefs.getString(_cartItemsKey);

    if (cartItemsJson != null) {
      List<dynamic> decodedItems = json.decode(cartItemsJson);
      _cartItems = decodedItems.map((item) => CartItem.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> saveCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cartItemsJson = json.encode(
      _cartItems.map((item) => item.toJson()).toList(),
    );
    await prefs.setString(_cartItemsKey, cartItemsJson);
  }

  void addToCart(String title, double price, String image) {
    final existingItemIndex = _cartItems.indexWhere(
      (item) => item.title == title,
    );
    if (existingItemIndex >= 0) {
      _cartItems[existingItemIndex].quantity += 1;
    } else {
      _cartItems.add(
        CartItem(title: title, price: price, image: image, quantity: 1),
      );

      saveCartItems();
      notifyListeners();
    }
  }
}
