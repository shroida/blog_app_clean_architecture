import 'package:blog_clean_architecture/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

import 'package:blog_clean_architecture/core/theme/app_color.dart';
import 'package:blog_clean_architecture/features/auth/presentation/pages/login_page.dart';

class NavigateTo extends StatelessWidget {
  const NavigateTo({
    super.key,
    this.navigateToLogin = false,
  });
  final bool navigateToLogin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                navigateToLogin ? const SignupPage() : const LoginPage(),
          ),
        );
      },
      child: RichText(
        text: TextSpan(
          text: navigateToLogin
              ? 'Already have an account? '
              : 'Don\'t have an account? ',
          style: Theme.of(context).textTheme.titleMedium,
          children: [
            TextSpan(
              text: navigateToLogin ? 'Sign In' : 'Sign Up',
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
