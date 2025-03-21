import 'package:blog_clean_architecture/core/theme/app_theme.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_cubit.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_state.dart';
import 'package:blog_clean_architecture/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogApp extends StatefulWidget {
  const BlogApp({super.key});

  @override
  State<BlogApp> createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().isUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Scaffold(body: CircularProgressIndicator());
          }
          if (state is AuthSuccess) {
            return const Scaffold(
              body: Center(
                child: Text('Hodsme'),
              ),
            );
          }
          return const SignupPage();
        },
      ),
    );
  }
}
