import 'package:book_ai/domain/api_input/api_input_failure.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';

abstract class IApiInputRepository {
  Future<Either<ApiInputFailure, Unit>> create(ApiInput apikey);
}
