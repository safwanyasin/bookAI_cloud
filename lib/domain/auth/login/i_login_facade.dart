import 'package:book_ai/domain/auth/login/login_failure.dart';
import 'package:book_ai/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


// using i along means that it is just interface with no implementation
abstract class ILoginFacade {
  Future<Either<LoginFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<LoginFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress emailAddress,
    @required Password password,
  });
  Future<Either<LoginFailure, Unit>> signInWithGoogle();
}