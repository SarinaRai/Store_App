import 'package:flutter/material.dart';
import 'package:store_app/view/cart/cart_view.dart';
import 'package:store_app/view/home/home_view.dart';
import 'package:store_app/view/profile/profile_view.dart';
import 'package:store_app/model/cart_item.dart';

class ButtomNavView extends StatefulWidget {
  const ButtomNavView({super.key});

  @override
  State<ButtomNavView> createState() => _ButtomNavViewState();
}

class _ButtomNavViewState extends State<ButtomNavView> {
  int _selectedIndex = 0;
  List<CartItem> cartItems = [];

  final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    CartView(cartItems: []),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.red, // Color of the selected tab
        unselectedItemColor: Colors.grey, // Color of unselected tabs
        showUnselectedLabels: true,
      ),
    );
  }
}
