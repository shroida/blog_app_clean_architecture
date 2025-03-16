import 'package:blog_clean_architecture/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isError;
  final bool isSuccess;

  const AuthGradientButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppColor.transparentColor;
    if (isError) {
      backgroundColor = Colors.red;
    } else if (isSuccess) {
      backgroundColor = Colors.green;
    }

    return Container(
      decoration: BoxDecoration(
        gradient: isLoading || isError || isSuccess
            ? null
            : const LinearGradient(
                colors: [
                  AppColor.gradient1,
                  AppColor.gradient2,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 55),
          backgroundColor: backgroundColor,
          shadowColor: AppColor.transparentColor,
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                buttonText,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
