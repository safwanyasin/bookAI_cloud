import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class Genre extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Genre(String input) {
    return Genre._(
      right(input),
    );
  }

  const Genre._(this.value);
}

class Setting extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Setting(String input) {
    return Setting._(
      right(input),
    );
  }

  const Setting._(this.value);
}

class TimePeriod extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TimePeriod(String input) {
    return TimePeriod._(
      right(input),
    );
  }

  const TimePeriod._(this.value);
}

class MainCharacterTraits extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MainCharacterTraits(String input) {
    return MainCharacterTraits._(
      right(input),
    );
  }

  const MainCharacterTraits._(this.value);
}

class Gender extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Gender(String input) {
    return Gender._(
      validateGender(input),
    );
  }

  const Gender._(this.value);
}

class NarrativeStyle extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NarrativeStyle(String input) {
    return NarrativeStyle._(
      validateNarrativeStyle(input),
    );
  }

  const NarrativeStyle._(this.value);
}
