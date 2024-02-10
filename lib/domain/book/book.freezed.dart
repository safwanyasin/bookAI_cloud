// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Book {
  UniqueId get bookId => throw _privateConstructorUsedError;
  BookName get bookName => throw _privateConstructorUsedError;
  AuthorName get authorName => throw _privateConstructorUsedError;
  Description get description => throw _privateConstructorUsedError;
  Language get language => throw _privateConstructorUsedError;
  PageCount get pageCount => throw _privateConstructorUsedError;
  ReviewCount get reviewCount => throw _privateConstructorUsedError;
  Rating get rating => throw _privateConstructorUsedError;
  ImageUrl get imageUrl => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {UniqueId bookId,
      BookName bookName,
      AuthorName authorName,
      Description description,
      Language language,
      PageCount pageCount,
      ReviewCount reviewCount,
      Rating rating,
      ImageUrl imageUrl,
      bool liked});
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? bookName = null,
    Object? authorName = null,
    Object? description = null,
    Object? language = null,
    Object? pageCount = null,
    Object? reviewCount = null,
    Object? rating = null,
    Object? imageUrl = null,
    Object? liked = null,
  }) {
    return _then(_value.copyWith(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as BookName,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as AuthorName,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Description,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as PageCount,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as ReviewCount,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Rating,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as ImageUrl,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId bookId,
      BookName bookName,
      AuthorName authorName,
      Description description,
      Language language,
      PageCount pageCount,
      ReviewCount reviewCount,
      Rating rating,
      ImageUrl imageUrl,
      bool liked});
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? bookName = null,
    Object? authorName = null,
    Object? description = null,
    Object? language = null,
    Object? pageCount = null,
    Object? reviewCount = null,
    Object? rating = null,
    Object? imageUrl = null,
    Object? liked = null,
  }) {
    return _then(_$BookImpl(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as BookName,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as AuthorName,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as Description,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as PageCount,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as ReviewCount,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Rating,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as ImageUrl,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BookImpl extends _Book {
  const _$BookImpl(
      {required this.bookId,
      required this.bookName,
      required this.authorName,
      required this.description,
      required this.language,
      required this.pageCount,
      required this.reviewCount,
      required this.rating,
      required this.imageUrl,
      required this.liked})
      : super._();

  @override
  final UniqueId bookId;
  @override
  final BookName bookName;
  @override
  final AuthorName authorName;
  @override
  final Description description;
  @override
  final Language language;
  @override
  final PageCount pageCount;
  @override
  final ReviewCount reviewCount;
  @override
  final Rating rating;
  @override
  final ImageUrl imageUrl;
  @override
  final bool liked;

  @override
  String toString() {
    return 'Book(bookId: $bookId, bookName: $bookName, authorName: $authorName, description: $description, language: $language, pageCount: $pageCount, reviewCount: $reviewCount, rating: $rating, imageUrl: $imageUrl, liked: $liked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.liked, liked) || other.liked == liked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookId, bookName, authorName,
      description, language, pageCount, reviewCount, rating, imageUrl, liked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);
}

abstract class _Book extends Book {
  const factory _Book(
      {required final UniqueId bookId,
      required final BookName bookName,
      required final AuthorName authorName,
      required final Description description,
      required final Language language,
      required final PageCount pageCount,
      required final ReviewCount reviewCount,
      required final Rating rating,
      required final ImageUrl imageUrl,
      required final bool liked}) = _$BookImpl;
  const _Book._() : super._();

  @override
  UniqueId get bookId;
  @override
  BookName get bookName;
  @override
  AuthorName get authorName;
  @override
  Description get description;
  @override
  Language get language;
  @override
  PageCount get pageCount;
  @override
  ReviewCount get reviewCount;
  @override
  Rating get rating;
  @override
  ImageUrl get imageUrl;
  @override
  bool get liked;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
