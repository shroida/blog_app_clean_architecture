import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:blog_clean_architecture/core/common/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, User>> signup({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> currentUser();
}
