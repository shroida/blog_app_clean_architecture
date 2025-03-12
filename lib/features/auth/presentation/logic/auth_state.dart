abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String userId;
  AuthSuccess({required this.userId});
}

class SignupSuccess extends AuthSuccess {
  SignupSuccess({required super.userId});
}

class LoginSuccess extends AuthSuccess {
  LoginSuccess({required super.userId});
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
