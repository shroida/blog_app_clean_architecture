import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/core/usecase/usecase.dart';
import 'package:blog_clean_architecture/core/common/entities/user.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepo authRepo;

  UserSignUp(this.authRepo);
  @override
  Future<Either<Failure, User>> call(params) async {
    return await authRepo.signup(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams(
      {required this.email, required this.password, required this.name});
}
