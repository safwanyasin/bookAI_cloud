import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'register_failure.freezed.dart';

@freezed
abstract class RegisterFailure with _$RegisterFailure {
  const factory RegisterFailure.cancelledByUser() = CancelledByUser;
  // Serves as a "catch all" failure if we don't know what exactly went wrong
  const factory RegisterFailure.serverError() = ServerError;
  // const factory RegisterFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory RegisterFailure.emailAlreadyInUse() =
      EmailAlreadyInUse;
  const factory RegisterFailure.otherFailure(String failureMessage) = OtherFailure;
}