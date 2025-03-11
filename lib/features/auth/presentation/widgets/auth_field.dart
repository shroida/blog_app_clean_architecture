import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.hinText,
    required this.controller,
    this.isObscureText = false,
  });

  final String hinText;
  final bool isObscureText;
  final TextEditingController controller;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hinText,
        suffixIcon: widget.isObscureText
            ? IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : null,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '${widget.hinText} is missing!';
        }
        return null;
      },
      obscureText: widget.isObscureText ? _isObscure : false,
    );
  }
}
