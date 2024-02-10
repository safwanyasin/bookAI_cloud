import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class SearchQuery extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SearchQuery(String input) {
    return SearchQuery._(
      right(input),
    );
  }

  const SearchQuery._(this.value);
}
