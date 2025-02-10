import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/store_app.dart';
import 'package:store_app/view_model/cart_viewmodel.dart';
import 'package:store_app/view_model/home_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartViewmodel()),
        ChangeNotifierProvider(create: (_) => HomeViewmodel()),
      ],
      child: StoreApp(),
    ),
  );
}
