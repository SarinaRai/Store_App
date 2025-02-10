import 'package:flutter/material.dart';
import 'package:store_app/model/cart_item.dart';

class CartViewmodel extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void setCartItems(List<CartItem> items) {
    _cartItems = items;
    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    if (index < 0 || index >= _cartItems.length) {
      return;
    }
    if (newQuantity <= 0) {
      _cartItems.removeAt(index);
    } else {
      _cartItems[index].quantity = newQuantity;
    }
    notifyListeners();
  }

  double get totalprice {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }
}
