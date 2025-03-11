import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/header_texts_signup.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/navigate_to_signup.dart';
import 'package:flutter/material.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const HeaderTextsSignup(),
            const SizedBox(
              height: 30,
            ),
            AuthField(
              controller: nameController,
              hinText: 'Name',
            ),
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
            AuthGradientButton(buttonText: 'Sign Up', onPressed: () {}),
            const SizedBox(height: 20),
            const NavigateTo(),
          ],
        ),
      ),
    );
  }
}
