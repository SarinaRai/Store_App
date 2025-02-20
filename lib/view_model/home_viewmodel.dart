import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/model/cart_item.dart';
import 'package:store_app/model/product._model.dart';
import 'package:store_app/repository/auth_repo/product_repo.dart';

class HomeViewmodel extends ChangeNotifier {
  bool fetchingData = false;

  List<ProductListModel> _products = [];
  List<ProductListModel> get products => _products;

  List<CartItem> _cartItems = [];
  static final String _cartItemsKey = 'cartItems';

  List<CartItem> get cartItems => _cartItems;

  final ProductRepository productRepository = ProductRepository();

  Future<void> fetchProduct() async {
    fetchingData = true;
    try {
      final fetchedProducts = await productRepository.getProductData();
      if (fetchedProducts != null) {
        _products = fetchedProducts;
        notifyListeners();
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      print(e.toString());
    }
    fetchingData = false;
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

  void addToCart(String title, dynamic price, String image) {
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
