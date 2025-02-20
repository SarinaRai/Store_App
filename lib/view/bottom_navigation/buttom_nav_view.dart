import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/view/home/home_view.dart';
import 'package:store_app/view/product/add_product_view.dart';
import 'package:store_app/view/profile/profile_view.dart';
import 'package:store_app/view_model/buttom_navigation_viewmodel.dart';

class ButtomNavView extends StatelessWidget {
  ButtomNavView({super.key});
  final List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    AddProductView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ButtomNavigationViewmodel(),
      child: Consumer<ButtomNavigationViewmodel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: _widgetOptions[viewModel.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.selectedIndex,
              onTap: viewModel.onItemTapped,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Add Product',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
            ),
          );
        },
      ),
    );
  }
}
