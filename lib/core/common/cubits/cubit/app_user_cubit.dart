import 'package:blog_clean_architecture/core/common/entities/user.dart';
import 'package:blog_clean_architecture/core/usecase/usecase.dart';
import 'package:blog_clean_architecture/features/auth/domain/usecases/current_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  final CurrentUser _currentUser; // Add this dependency

  AppUserCubit(this._currentUser) : super(AppUserInitial());

  Future<void> isUserLoggedIn() async {
    final result = await _currentUser.call(NoParams());
    result.fold(
      (failure) => emit(AppUserInitial()),
      (user) => emit(AppUserLoggedIn(user)),
    );
  }

  void updateUser(User? user) {
    if (user == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(user));
    }
  }
}
