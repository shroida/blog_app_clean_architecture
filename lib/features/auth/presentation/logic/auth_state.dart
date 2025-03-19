import 'package:blog_clean_architecture/core/common/entities/user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess({required this.user});
}

class SignupSuccess extends AuthSuccess {
  SignupSuccess({required super.user});
}

class LoginSuccess extends AuthSuccess {
  LoginSuccess({required super.user});
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure({required this.message});
}

class SignupFailure extends AuthFailure {
  SignupFailure({required super.message});
}

class LoginFailure extends AuthFailure {
  LoginFailure({required super.message});
}
