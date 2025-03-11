// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_clean_architecture/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

import 'package:blog_clean_architecture/core/theme/app_color.dart';
import 'package:blog_clean_architecture/features/auth/presentation/pages/login_page.dart';

class NavigateToSignUp extends StatelessWidget {
  const NavigateToSignUp({
    super.key,
    this.navigateToLogin = true,
  });
  final bool navigateToLogin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    navigateToLogin ? const LoginPage() : const SignupPage()));
      },
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: Theme.of(context).textTheme.titleMedium,
          children: [
            TextSpan(
              text: 'Sign In',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColor.gradient2,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
