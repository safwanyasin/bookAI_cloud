import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class StoryTitle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StoryTitle(String input) {
    return StoryTitle._(
      checkIfEmpty(input),
    );
  }

  const StoryTitle._(this.value);
}

class Content extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Content(String input) {
    return Content._(
      checkIfEmpty(input),
    );
  }

  const Content._(this.value);
}
