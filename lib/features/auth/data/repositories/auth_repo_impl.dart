import 'package:blog_clean_architecture/core/constant/topics_constants.dart';
import 'package:blog_clean_architecture/core/error/exceptions.dart';
import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/core/network/connection_checker.dart';
import 'package:blog_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_clean_architecture/core/common/entities/user.dart';
import 'package:blog_clean_architecture/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final ConnectionChecker connectionChecker;

  const AuthRepoImpl(this._authRemoteDataSource, this.connectionChecker);

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    return _handleRemoteCall(
      () => _authRemoteDataSource.login(email: email, password: password),
    );
  }

  @override
  Future<Either<Failure, User>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    return _handleRemoteCall(
      () => _authRemoteDataSource.signup(
          name: name, email: email, password: password),
    );
  }

  Future<Either<Failure, User>> _handleRemoteCall(
    Future<User> Function() remoteCall,
  ) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(
            const ServerFailure(TopicsConstants.noConnectionErrorMessage));
      }
      final user = await remoteCall();

      return right(user);
    } on ServerExceptions catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      final user = await _authRemoteDataSource.getCurrrentUserData();
      if (user == null) {
        return left(const ServerFailure('User not logged in!'));
      } else {
        return right(user);
      }
    } on ServerExceptions catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
