import 'package:blog_clean_architecture/core/theme/app_theme.dart';
import 'package:blog_clean_architecture/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const SignupPage(),
    );
  }
}
