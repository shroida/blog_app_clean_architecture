import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, String>> signup({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });
}
