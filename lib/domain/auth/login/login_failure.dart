import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'login_failure.freezed.dart';

@freezed
abstract class LoginFailure with _$LoginFailure {
  const factory LoginFailure.cancelledByUser() = CancelledByUser;
  // Serves as a "catch all" failure if we don't know what exactly went wrong
  const factory LoginFailure.serverError() = ServerError;
  // const factory LoginFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory LoginFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
  const factory LoginFailure.otherFailure(String failureMessage) = OtherFailure;
}
