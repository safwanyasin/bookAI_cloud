import 'package:book_ai/domain/book/book.dart';
import 'package:book_ai/domain/book/value_objects.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'book_dtos.freezed.dart';
part 'book_dtos.g.dart';

@freezed
abstract class BookDto implements _$BookDto {
  const BookDto._();

  const factory BookDto({
    // @JsonKey(includeToJson: true) String bookId, // check if this is needed
    required String book_id,
    // String user_id,
    required String book_name,
    required String author_name,
    required String description,
    required String language,
    required int page_count,
    required int review_count,
    required double rating,
    required String image_url,
    required String category,
    required String publisher,
    required String publish_date,
    // @ServerTimestampConverter() required FieldValue serverTimestamp,
    @Default(false) bool liked,
  }) = _BookDto;

  factory BookDto.fromDomain(Book book) {
    return BookDto(
      book_id: book.bookId.getOrCrash(),
      book_name: book.bookName.getOrCrash(),
      author_name: book.authorName.getOrCrash(),
      description: book.description.getOrCrash(),
      language: book.language.getOrCrash(),
      page_count: book.pageCount.getOrCrash(),
      review_count: book.reviewCount.getOrCrash(),
      rating: book.rating.getOrCrash(),
      image_url: book.imageUrl.getOrCrash(),
      category: book.category.getOrCrash(),
      publisher: book.publisher.getOrCrash(),
      publish_date: book.publishDate.getOrCrash(),
      // serverTimestamp: FieldValue.serverTimestamp(),
    );
  }

  Book toDomain() {
    return Book(
      bookId: UniqueId.fromUniqueString(book_id),
      bookName: BookName(book_name),
      authorName: AuthorName(author_name),
      description: Description(description),
      language: Language(language),
      pageCount: PageCount(page_count),
      reviewCount: ReviewCount(review_count),
      rating: Rating(rating),
      imageUrl: ImageUrl(image_url),
      category: Category(category),
      publisher: Publisher(publisher),
      publishDate: PublishDate(publish_date),
    );
  }

  factory BookDto.fromJson(Map<String, dynamic> json) {
    final BookDto object = BookDto(
      author_name: json["author_name"],
      book_id: json["book_id"],
      book_name: json["book_name"],
      description: json["description"],
      language: json["language"],
      page_count: json["page_count"],
      review_count: json["review_count"],
      rating: double.parse(json["rating"]),
      image_url: json["image_url"],
      category: json["category"],
      publisher: json["publisher"],
      publish_date: json["publish_date"],
    );
    return object;
  }

  factory BookDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['bookId'] = doc.id;
    return BookDto.fromJson(data);
  }

  // can maybe add a .fromdio function
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}
