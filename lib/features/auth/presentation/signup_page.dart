import 'package:blog_clean_architecture/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create Account',
                  style: AppTextStyles.headline1,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  'Sign up now and start exploring all that our app has to offer.\nWe\'re excited to welcome you to our community!',
                  style: AppTextStyles.caption.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 34,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
