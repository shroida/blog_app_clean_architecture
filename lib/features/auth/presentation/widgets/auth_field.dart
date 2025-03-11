import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({super.key, required this.hinText, required this.controller});
  final String hinText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hinText),
      validator: (value) {
        if (value!.isEmpty) {
          return '$hinText is missing!';
        }
        return null;
      },
    );
  }
}
