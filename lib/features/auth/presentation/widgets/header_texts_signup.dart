import 'package:blog_clean_architecture/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderTextsSignup extends StatelessWidget {
  const HeaderTextsSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
