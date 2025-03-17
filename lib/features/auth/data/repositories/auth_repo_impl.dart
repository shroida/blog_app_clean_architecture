import 'package:blog_clean_architecture/core/error/exceptions.dart';
import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_clean_architecture/features/auth/domain/entities/user.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  const AuthRepoImpl(this._authRemoteDataSource);
  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) async {
    try {
      final user =
          await _authRemoteDataSource.login(email: email, password: password);
      return right(user);
    } on ServerExceptions catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final user = await _authRemoteDataSource.signup(
          name: name, email: email, password: password);
      return right(user);
    } on ServerExceptions catch (e) {
      return left(Failure(e.message));
    }
  }
}
