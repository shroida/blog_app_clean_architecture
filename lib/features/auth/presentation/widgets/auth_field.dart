// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField(
      {super.key,
      required this.hinText,
      required this.controller,
      this.isObscureText = false});
  final String hinText;
  final bool isObscureText;
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
      obscureText: isObscureText,
    );
  }
}
