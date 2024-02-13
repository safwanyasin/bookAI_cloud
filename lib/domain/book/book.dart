import 'package:book_ai/domain/book/value_objects.dart';
import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:book_ai/infrastructure/book/book_dtos.dart';
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
    required Category category,
    required Publisher publisher,
    required PublishDate publishDate,
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
        imageUrl: ImageUrl("https://placehold.co/190x280"),
        category: Category('none'),
        publisher: Publisher('none'),
        publishDate: PublishDate('-'),
      );

  factory Book.fromGoogleBooksApi(Map<String, dynamic> data) {
    final BookDto bookData = BookDto(
      bookId: data['id'],
      bookName: data['volumeInfo']['title'],
      authorName: data['volumeInfo']['authors']?.join(', ') ?? 'Unknown Author',
      description: data['volumeInfo']['description'] ?? 'No Description',
      language: data['volumeInfo']['language'] ?? 'Unknown Language',
      pageCount: data['volumeInfo']['pageCount'] ?? 0,
      reviewCount: data['volumeInfo']['ratingsCount'] ?? 0,
      rating: data['volumeInfo']['averageRating'] == null
          ? 0
          : data['volumeInfo']['averageRating'].toDouble(),
      // imageUrl: data['volumeInfo']['imageLinks']['thumbnail'] ??
      //     'https://placehold.co/190x280',
      imageUrl: data['volumeInfo']['imageLinks'] == null
          ? 'https://placehold.co/190x280.png'
          : data['volumeInfo']['imageLinks']['thumbnail'] ??
              'https://placehold.co/190x280.png',
      category: data['volumeInfo']['categories'] == null
          ? 'None'
          : data['volumeInfo']['categories'].join(','),
      publisher: data['volumeInfo']['publisher'] ?? 'none',
      publishDate: data['volumeInfo']['publishedDate'] ?? '-',
    );
    return bookData.toDomain();
    // return Book(
    //   bookId: UniqueId.fromUniqueString(data['id']),
    //   bookName: data['volumeInfo']['title'],
    //   authorName: data['volumeInfo']['authors']?.join(', ') ?? 'Unknown Author',
    //   description: data['volumeInfo']['description'] ?? 'No Description',
    //   language: data['volumeInfo']['language'] ?? 'Unknown Language',
    //   pageCount: data['volumeInfo']['pageCount'] ?? 0,
    //   reviewCount: data['volumeInfo']['ratingsCount'] ?? 0,
    //   rating: data['volumeInfo']['averageRating'] ?? 0,
    //   imageUrl: data['volumeInfo']['imageLinks']['thumbnail'] ??
    //       'https://placehold.co/190x280',
    //   liked: false,
    // );
  }
  Option<ValueFailure<dynamic>> get failureOption {
    return bookName.failureOrUnit
        .andThen(authorName.failureOrUnit.andThen(description.failureOrUnit
            .andThen(language.failureOrUnit.andThen(pageCount.failureOrUnit
                .andThen(reviewCount.failureOrUnit.andThen(
                    rating.failureOrUnit.andThen(imageUrl.failureOrUnit)))))))
        .fold((f) => some(f), (_) => none());
  }

}
