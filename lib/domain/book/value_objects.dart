import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

// class BookId extends ValueObject<String> {
//   @override
//   final Either<ValueFailure<String>, String> value;

//   factory BookId(String input) {
//     return BookId._(
//       checkIfEmpty(input),
//     );
//   }

//   const BookId._(this.value);
// }

class BookName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory BookName(String input) {
    return BookName._(
      checkIfEmpty(input),
    );
  }

  const BookName._(this.value);
}

class AuthorName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory AuthorName(String input) {
    return AuthorName._(
      checkIfEmpty(input),
    );
  }

  const AuthorName._(this.value);
}

class Description extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Description(String input) {
    return Description._(
      checkIfEmpty(input),
    );
  }

  const Description._(this.value);
}

class Language extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Language(String input) {
    return Language._(
      checkIfEmpty(input),
    );
  }

  const Language._(this.value);
}

class PageCount extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory PageCount(int input) {
    return PageCount._(
      positiveInt(input),
    );
  }

  const PageCount._(this.value);
}

class ReviewCount extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory ReviewCount(int input) {
    return ReviewCount._(
      positiveInt(input),
    );
  }

  const ReviewCount._(this.value);
}

class Rating extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory Rating(double input) {
    return Rating._(
      validateRating(input),
    );
  }

  const Rating._(this.value);
}

class ImageUrl extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ImageUrl(String input) {
    return ImageUrl._(
      checkIfEmpty(input),
    );
  }

  const ImageUrl._(this.value);
}

