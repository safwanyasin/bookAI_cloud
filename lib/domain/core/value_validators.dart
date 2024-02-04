import 'package:book_ai/domain/core/failures.dart';
import 'package:dartz/dartz.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
  // check if email already in use and handle appropriately
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // You can also add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
  if (input.length < 6) {
    return left(ValueFailure<String>.shortPassword(failedValue: input));
  } else if (!input.contains(RegExp(r'[A-Z]'))) {
    return left(ValueFailure<String>.noUppercase(failedValue: input));
  } else if (!input.contains(RegExp(r'[a-z]'))) {
    return left(ValueFailure<String>.noLowercase(failedValue: input));
  } else if (!input.contains(RegExp(r'[0-9]'))) {
    return left(ValueFailure<String>.noNumeric(failedValue: input));
  } else if (!input.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return left(ValueFailure<String>.noSpecialCharacter(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateConfirmPassword(
    String input, String password) {
  if (input != password) {
    return Left(ValueFailure<String>.passwordMismatch(failedValue: input));
  } else {
    return Right(input);
  }
}

Either<ValueFailure<String>, String> validateFullName(String input) {
  if (input.isEmpty) {
    return left(ValueFailure<String>.empty(failedValue: input));
  } else if (input.length < 2) {
    return left(ValueFailure<String>.shortLength(failedValue: input));
  } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(input)) {
    return left(ValueFailure<String>.invalidCharacters(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateParameterInput(String input) {
  if (input.length == 1 || input.length == 2) {
    return left(ValueFailure<String>.shortLength(failedValue: input));
  } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(input)) {
    return left(ValueFailure<String>.invalidCharacters(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateOpenApiKey(String input) {
  // Implement your validation logic for OpenAI API key
  // You can check for length, special characters, or any specific format
  // Example:
  if (input.isEmpty) {
    return left(ValueFailure<String>.empty(failedValue: input));
  } else if (input.length != 64) {
    return left(ValueFailure<String>.incorrectLength(failedValue: input));
  } else {
    return right(input);
  }
}
