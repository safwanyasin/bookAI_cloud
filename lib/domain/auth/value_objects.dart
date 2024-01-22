import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class FullName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FullName(String input) {
    assert(input != null);
    return FullName._(
      validateFullName(input),
    );
  }

  const FullName._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

class ParameterInput extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ParameterInput(String input) {
    assert(input != null);
    return ParameterInput._(
      validateParameterInput(input),
    );
  }

  const ParameterInput._(this.value);
}

class ApiInput extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ApiInput(String input) {
    assert(input != null);
    return ApiInput._(
      validateParameterInput(input),
    );
  }

  const ApiInput._(this.value);
}
