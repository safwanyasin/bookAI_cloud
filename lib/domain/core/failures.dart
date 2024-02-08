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
  const factory ValueFailure.passwordMismatch({
    required T failedValue,
    required T otherValue
    // @required T failedValue,
  }) = PasswordMismatch<T>;
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

  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  const factory ValueFailure.negative({
    required T failedValue,
  }) = Negative<T>;

  const factory ValueFailure.shortLength({
    required T failedValue,
  }) = ShortLength<T>;

  const factory ValueFailure.invalidCharacters({
    required T failedValue,
  }) = InvalidCharacters<T>;

  const factory ValueFailure.incorrectLength({
    required T failedValue,
  }) = IncorrectLength<T>;

  const factory ValueFailure.shortQuery({
    required T failedValue,
  }) = ShortQuery<T>;
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.invalidImageUrl({
    required T failedValue,
    // @required T failedValue,
  }) = InvalidImageUrl<T>;
  const factory ValueFailure.invalidValue({
    required T failedValue,
    // @required T failedValue,
  }) = InvalidValue<T>;
}
