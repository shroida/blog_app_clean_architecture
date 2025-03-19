import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/core/usecase/usecase.dart';
import 'package:blog_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepo _authRepo;

  CurrentUser(this._authRepo);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await _authRepo.currentUser();
  }
}

class NoParams {}
