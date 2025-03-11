import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({super.key, required this.hinText});
  final String hinText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
