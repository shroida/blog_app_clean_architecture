import 'package:blog_clean_architecture/core/theme/app_color.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/header_texts_signup.dart';
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
              children: [
                const HeaderTextsSignup(),
                const SizedBox(
                  height: 30,
                ),
                const AuthField(
                  hinText: 'Name',
                ),
                const SizedBox(
                  height: 30,
                ),
                const AuthField(
                  hinText: 'Email',
                ),
                const SizedBox(
                  height: 30,
                ),
                const AuthField(
                  hinText: 'Password',
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthGradientButton(buttonText: 'Sign Up', onPressed: () {}),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, LoginPage.route());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColor.gradient2,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
