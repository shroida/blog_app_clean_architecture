import 'package:blog_clean_architecture/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase<SuccessType,Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
