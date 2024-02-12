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

Either<ValueFailure<String>, String> validateLoginPassword(String input) {
  if (input.length == 0) {
    return left(ValueFailure<String>.empty(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateConfirmPassword(
    String input, String password) {
  if (input != password) {
    print("confirm pass " + input);
    print("password " + password);
    return Left(ValueFailure<String>.passwordMismatch(
        failedValue: input, otherValue: password));
  } else {
    return Right(input);
  }
}

Either<ValueFailure<String>, String> validateFullName(String input) {
  if (input.isEmpty) {
    return left(ValueFailure<String>.empty(failedValue: input));
  } else if (input.length < 3) {
    return left(ValueFailure<String>.shortLength(failedValue: input));
  } else if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(input)) {
    return left(ValueFailure<String>.invalidCharacters(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateNickName(String input) {
  if (input.isEmpty) {
    return left(ValueFailure<String>.empty(failedValue: input));
  } else if (input.length < 3) {
    return left(ValueFailure<String>.shortLength(failedValue: input));
  } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(input)) {
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

Either<ValueFailure<String>, String> validateMaxStringLength(
    String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> checkIfEmpty(String input) {
  if (input.isEmpty) {
    return left(ValueFailure<String>.empty(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<int>, int> positiveInt(int input) {
  if (input < 0) {
    return left(ValueFailure<int>.negative(failedValue: input));
  } else {
    return right(input);
  }
}

// value failure for rating which can be a double between 0 and 5
Either<ValueFailure<double>, double> validateRating(double input) {
  if (input < 0 || input > 5) {
    return left(ValueFailure<double>.negative(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateUrl(String url) {
  // Regular expression for the given URL format
  RegExp urlRegExp = RegExp(
    r'^http://books\.google\.com/books/content\?id=[a-zA-Z0-9_-]+&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api$',
  );

  if (url.isEmpty) {
    return left(ValueFailure<String>.empty(failedValue: url));
  } else if (!urlRegExp.hasMatch(url)) {
    return left(ValueFailure<String>.invalidImageUrl(failedValue: url));
  } else {
    return right(url);
  }
}

Either<ValueFailure<String>, String> validateBookId(String bookId) {
  if (bookId.isEmpty) {
    return left(ValueFailure<String>.empty(failedValue: bookId));
  } else if (bookId.length != 12) {
    return left(ValueFailure<String>.incorrectLength(failedValue: bookId));
  } else if (!RegExp(r"^[a-zA-Z0-9_-]+$").hasMatch(bookId)) {
    return left(ValueFailure<String>.invalidCharacters(failedValue: bookId));
  } else {
    return right(bookId);
  }
}

Either<ValueFailure<String>, String> validateGender(String gender) {
  if (gender == 'male' || gender == 'female' || gender == 'prefer not to say') {
    return right(gender);
  } else {
    return left(ValueFailure<String>.invalidValue(failedValue: gender));
  }
}

Either<ValueFailure<String>, String> validateNarrativeStyle(String style) {
  if (style == 'male' || style == 'female' || style == 'prefer not to say') {
    return right(style);
  } else {
    return left(ValueFailure<String>.invalidValue(failedValue: style));
  }
}
