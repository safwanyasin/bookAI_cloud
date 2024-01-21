import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required T failedValue,
    // @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.emailAlreadyInUse({
    required T failedValue,
    // @required T failedValue,
  }) = EmailAlreadyInUse<T>;
  const factory ValueFailure.shortPassword({
    required T failedValue,
    // @required T failedValue,
  }) = ShortPassword<T>;
  const factory ValueFailure.noUppercase({
    required T failedValue,
  }) = NoUppercase<T>;

  const factory ValueFailure.noLowercase({
    required T failedValue,
  }) = NoLowercase<T>;

  const factory ValueFailure.noNumeric({
    required T failedValue,
  }) = NoNumeric<T>;

  const factory ValueFailure.noSpecialCharacter({
    required T failedValue,
  }) = NoSpecialCharacter<T>;
}
