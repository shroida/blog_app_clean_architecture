import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/header_texts_login.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/navigate_to_signup.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const HeaderTextsLogin(),
            const SizedBox(
              height: 30,
            ),
            AuthField(
              controller: emailController,
              hinText: 'Email',
            ),
            const SizedBox(
              height: 30,
            ),
            AuthField(
              controller: passwordController,
              hinText: 'Password',
              isObscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            AuthGradientButton(buttonText: 'Login', onPressed: () {}),
            const SizedBox(height: 20),
            const NavigateTo(
              navigateToLogin: false,
            ),
          ],
        ),
      ),
    );
  }
}
