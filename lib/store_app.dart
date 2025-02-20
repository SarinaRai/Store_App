import 'package:flutter/material.dart';
import 'package:store_app/view/auth/login_view.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginView());
  }
}
