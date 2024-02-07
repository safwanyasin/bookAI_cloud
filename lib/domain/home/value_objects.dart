import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class SearchInput extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const maxLength = 300;

  factory SearchInput(String input) {
    return SearchInput._(
      validateMaxStringLength(input, maxLength),
    );
  }

  const SearchInput._(this.value);
}

// if you want to do multiple validations this can be used
//  return NoteBody._(
    //   validateMaxStringLength(input, maxLength).flatMap(validateStringNotEmpty),
    // );


// class NoteColor extends ValueObject<Color> {
//   static const List<Color> predefinedColors = [
//     Color(0xfffafafa), // canvas
//     Color(0xfffa8072), // salmon
//     Color(0xfffedc56), // mustard
//     Color(0xffd0f0c0), // tea
//     Color(0xfffca3b7), // flamingo
//     Color(0xff997950), // tortilla
//     Color(0xfffffdd0), // cream
//   ];

//   @override
//   final Either<ValueFailure<Color>, Color> value;

//   factory NoteColor(Color input) {
//     assert(input != null);
//     return NoteColor._(
//       right(makeColorOpaque(input)),
//     );
//   }

//   const NoteColor._(this.value);
// }