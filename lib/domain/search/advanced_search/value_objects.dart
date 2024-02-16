import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class GeneralSearchTerm extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory GeneralSearchTerm(String input) {
    return GeneralSearchTerm._(
      right(input),
    );
  }

  const GeneralSearchTerm._(this.value);
}

class Title extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Title(String input) {
    return Title._(
      right(input),
    );
  }

  const Title._(this.value);
}

class Author extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Author(String input) {
    return Author._(
      right(input),
    );
  }

  const Author._(this.value);
}

class Publisher extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Publisher(String input) {
    return Publisher._(
      right(input),
    );
  }

  const Publisher._(this.value);
}

class Subject extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Subject(String input) {
    return Subject._(
      right(input),
    );
  }

  const Subject._(this.value);
}

class PrintType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PrintType(String input) {
    return PrintType._(
      validatePrintType(input),
    );
  }

  const PrintType._(this.value);
}

class Isbn extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Isbn(String input) {
    return Isbn._(
      right(input),
    );
  }

  const Isbn._(this.value);
}

class OrderBy extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OrderBy(String input) {
    return OrderBy._(
      validateOrderBy(input),
    );
  }

  const OrderBy._(this.value);
}
