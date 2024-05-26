import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
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
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

class LoginPassword extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory LoginPassword(String input) {
    return LoginPassword._(
      validateLoginPassword(input),
    );
  }

  const LoginPassword._(this.value);
}

class ConfirmPassword extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ConfirmPassword(String input, String pass) {
    return ConfirmPassword._(
      validateConfirmPassword(input, pass),
    );
  }

  const ConfirmPassword._(this.value);
}

class Otp extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Otp(String input) {
    return Otp._(
      right(input),
    );
  }

  const Otp._(this.value);
}

class ParameterInput extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ParameterInput(String input) {
    return ParameterInput._(
      validateParameterInput(input),
    );
  }

  const ParameterInput._(this.value);
}

class NickName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NickName(String input) {
    return NickName._(
      validateNickName(input),
    );
  }

  const NickName._(this.value);
}

class JwtToken extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory JwtToken(String input) {
    return JwtToken._(
      validateNickName(input),
    );
  }

  const JwtToken._(this.value);
}

class ApiInput extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ApiInput(String input) {
    return ApiInput._(
      validateOpenApiKey(input),
    );
  }

  const ApiInput._(this.value);
}

class ApiKey extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ApiKey(String input) {
    return ApiKey._(
      validateOpenApiKey(input),
    );
  }

  const ApiKey._(this.value);
}
