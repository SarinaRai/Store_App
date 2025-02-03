import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const CommonTextfield({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
