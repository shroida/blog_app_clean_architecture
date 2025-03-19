import 'package:blog_clean_architecture/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:blog_clean_architecture/core/common/entities/user.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecases/current_user.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecases/user_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blog_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_clean_architecture/features/auth/presentation/logic/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  AuthCubit(
      this._userSignUp, this._userLogin, this._currentUser, this._appUserCubit)
      : super(AuthInitial());

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final response = await _userSignUp.call(
        UserSignUpParams(email: email, password: password, name: name),
      );

      response.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (user) => _emitAuthSuccess(user, emit),
      );
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final response = await _userLogin
          .call(UserLoginParams(email: email, password: password));
      response.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (user) => _emitAuthSuccess(user, emit),
      );
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  Future<void> isUserLoggedIn() async {
    emit(AuthLoading());
    try {
      final res = await _currentUser.call(NoParams());
      res.fold(
        (failure) => emit(AuthFailure(message: failure.message)),
        (user) => _emitAuthSuccess(user, emit),
      );
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  void _emitAuthSuccess(User user, void Function(AuthState) emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user: user));
  }
}
