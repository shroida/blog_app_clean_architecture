import 'package:blog_clean_architecture/features/auth/presentation/widgets/header_texts_signup.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [HeaderTextsSignup()],
            ),
          ),
        ),
      ),
    );
  }
}
