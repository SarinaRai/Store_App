import 'package:flutter/material.dart';
import 'package:store_app/view/welcome/welcome_view.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: WelcomeView());
  }
}
