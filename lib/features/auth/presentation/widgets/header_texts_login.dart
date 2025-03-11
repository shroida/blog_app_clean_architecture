import 'package:blog_clean_architecture/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderTextsLogin extends StatelessWidget {
  const HeaderTextsLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome Back',
          style: AppTextStyles.headline1,
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          'Log in to continue exploring all that our app has to offer.\nWe\'re glad to have you back!',
          style: AppTextStyles.caption.copyWith(color: Colors.grey),
        ),
        const SizedBox(
          height: 34,
        ),
      ],
    );
  }
}
