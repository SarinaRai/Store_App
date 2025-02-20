import 'package:flutter/material.dart';

class TextEditingControllers {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  TextEditingControllers()
    : emailController = TextEditingController(),
      passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
