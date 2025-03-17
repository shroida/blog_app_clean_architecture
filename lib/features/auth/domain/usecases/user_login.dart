import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/core/usecase/usecase.dart';
import 'package:blog_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepo _authRepo;

  UserLogin(this._authRepo);
  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await _authRepo.login(
        email: params.email, password: params.password);
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
