import 'package:book_ai/domain/book/value_objects.dart';
import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

@freezed
abstract class Book implements _$Book {
  const Book._();
  const factory Book({
    required UniqueId bookId,
    required BookName bookName,
    required AuthorName authorName,
    required Description description,
    required Language language,
    required PageCount pageCount,
    required ReviewCount reviewCount,
    required Rating rating,
    required ImageUrl imageUrl,
    @Default(false) bool liked,
  }) = _Book;

  factory Book.empty() => Book(
        bookId: UniqueId.ofSpecificLength(12),
        bookName: BookName('Default'),
        authorName: AuthorName('Default'),
        description: Description('Default'),
        language: Language('Default'),
        pageCount: PageCount(0),
        reviewCount: ReviewCount(0),
        rating: Rating(0),
        imageUrl: ImageUrl(
            "http://books.google.com/books/content?id=8MXK_KrHOZYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"),
        liked: false,
      );
  Option<ValueFailure<dynamic>> get failureOption {
    return bookName.failureOrUnit
        .andThen(authorName.failureOrUnit.andThen(description.failureOrUnit
            .andThen(language.failureOrUnit.andThen(pageCount.failureOrUnit
                .andThen(reviewCount.failureOrUnit.andThen(
                    rating.failureOrUnit.andThen(imageUrl.failureOrUnit)))))))
        .fold((f) => some(f), (_) => none());
  }
}
