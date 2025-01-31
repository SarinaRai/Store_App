import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  final String labelText;
  const CommonTextfield({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
