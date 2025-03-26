import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_cubit.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_state.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/header_texts_login.dart';
import 'package:blog_clean_architecture/features/auth/presentation/widgets/navigate_to_signup.dart';
import 'package:blog_clean_architecture/features/blog/presentation/pages/blog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              BlogPage.route(),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          bool isLoading = state is AuthLoading;
          bool isError = state is AuthFailure;
          bool isSuccess = state is AuthSuccess;
          return Form(
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
                AuthGradientButton(
                    isError: isError,
                    isLoading: isLoading,
                    isSuccess: isSuccess,
                    buttonText: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    }),
                const SizedBox(height: 20),
                const NavigateTo(
                  navigateToLogin: false,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
