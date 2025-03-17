// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_clean_architecture/features/auth/domain/usecases/user_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  AuthCubit(this._userSignUp, this._userLogin) : super(AuthInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading()); // Emit loading state
    try {
      final response = await _userSignUp.call(
        UserSignUpParams(email: email, password: password, name: name),
      );

      response.fold(
        (failure) =>
            emit(AuthFailure(message: failure.message)), // Emit failure state
        (user) => emit(AuthSuccess(user: user)), // Emit success state
      );
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading()); // Emit loading state
    try {
      final response = await _userLogin
          .call(UserLoginParams(email: email, password: password));
      response.fold((failure) => emit(AuthFailure(message: failure.message)),
          (user) => emit(AuthSuccess(user: user)));
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
