// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookDto _$BookDtoFromJson(Map<String, dynamic> json) {
  return _BookDto.fromJson(json);
}

/// @nodoc
mixin _$BookDto {
// @JsonKey(includeToJson: true) String bookId, // check if this is needed
  String get book_id => throw _privateConstructorUsedError; // String user_id,
  String get book_name => throw _privateConstructorUsedError;
  String get author_name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get page_count => throw _privateConstructorUsedError;
  int get review_count => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get image_url => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  String get publish_date =>
      throw _privateConstructorUsedError; // @ServerTimestampConverter() required FieldValue serverTimestamp,
  bool get liked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookDtoCopyWith<BookDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDtoCopyWith<$Res> {
  factory $BookDtoCopyWith(BookDto value, $Res Function(BookDto) then) =
      _$BookDtoCopyWithImpl<$Res, BookDto>;
  @useResult
  $Res call(
      {String book_id,
      String book_name,
      String author_name,
      String description,
      String language,
      int page_count,
      int review_count,
      double rating,
      String image_url,
      String category,
      String publisher,
      String publish_date,
      bool liked});
}

/// @nodoc
class _$BookDtoCopyWithImpl<$Res, $Val extends BookDto>
    implements $BookDtoCopyWith<$Res> {
  _$BookDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book_id = null,
    Object? book_name = null,
    Object? author_name = null,
    Object? description = null,
    Object? language = null,
    Object? page_count = null,
    Object? review_count = null,
    Object? rating = null,
    Object? image_url = null,
    Object? category = null,
    Object? publisher = null,
    Object? publish_date = null,
    Object? liked = null,
  }) {
    return _then(_value.copyWith(
      book_id: null == book_id
          ? _value.book_id
          : book_id // ignore: cast_nullable_to_non_nullable
              as String,
      book_name: null == book_name
          ? _value.book_name
          : book_name // ignore: cast_nullable_to_non_nullable
              as String,
      author_name: null == author_name
          ? _value.author_name
          : author_name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      page_count: null == page_count
          ? _value.page_count
          : page_count // ignore: cast_nullable_to_non_nullable
              as int,
      review_count: null == review_count
          ? _value.review_count
          : review_count // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      publish_date: null == publish_date
          ? _value.publish_date
          : publish_date // ignore: cast_nullable_to_non_nullable
              as String,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookDtoImplCopyWith<$Res> implements $BookDtoCopyWith<$Res> {
  factory _$$BookDtoImplCopyWith(
          _$BookDtoImpl value, $Res Function(_$BookDtoImpl) then) =
      __$$BookDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String book_id,
      String book_name,
      String author_name,
      String description,
      String language,
      int page_count,
      int review_count,
      double rating,
      String image_url,
      String category,
      String publisher,
      String publish_date,
      bool liked});
}

/// @nodoc
class __$$BookDtoImplCopyWithImpl<$Res>
    extends _$BookDtoCopyWithImpl<$Res, _$BookDtoImpl>
    implements _$$BookDtoImplCopyWith<$Res> {
  __$$BookDtoImplCopyWithImpl(
      _$BookDtoImpl _value, $Res Function(_$BookDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book_id = null,
    Object? book_name = null,
    Object? author_name = null,
    Object? description = null,
    Object? language = null,
    Object? page_count = null,
    Object? review_count = null,
    Object? rating = null,
    Object? image_url = null,
    Object? category = null,
    Object? publisher = null,
    Object? publish_date = null,
    Object? liked = null,
  }) {
    return _then(_$BookDtoImpl(
      book_id: null == book_id
          ? _value.book_id
          : book_id // ignore: cast_nullable_to_non_nullable
              as String,
      book_name: null == book_name
          ? _value.book_name
          : book_name // ignore: cast_nullable_to_non_nullable
              as String,
      author_name: null == author_name
          ? _value.author_name
          : author_name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      page_count: null == page_count
          ? _value.page_count
          : page_count // ignore: cast_nullable_to_non_nullable
              as int,
      review_count: null == review_count
          ? _value.review_count
          : review_count // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      image_url: null == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      publish_date: null == publish_date
          ? _value.publish_date
          : publish_date // ignore: cast_nullable_to_non_nullable
              as String,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookDtoImpl extends _BookDto {
  const _$BookDtoImpl(
      {required this.book_id,
      required this.book_name,
      required this.author_name,
      required this.description,
      required this.language,
      required this.page_count,
      required this.review_count,
      required this.rating,
      required this.image_url,
      required this.category,
      required this.publisher,
      required this.publish_date,
      this.liked = false})
      : super._();

  factory _$BookDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookDtoImplFromJson(json);

// @JsonKey(includeToJson: true) String bookId, // check if this is needed
  @override
  final String book_id;
// String user_id,
  @override
  final String book_name;
  @override
  final String author_name;
  @override
  final String description;
  @override
  final String language;
  @override
  final int page_count;
  @override
  final int review_count;
  @override
  final double rating;
  @override
  final String image_url;
  @override
  final String category;
  @override
  final String publisher;
  @override
  final String publish_date;
// @ServerTimestampConverter() required FieldValue serverTimestamp,
  @override
  @JsonKey()
  final bool liked;

  @override
  String toString() {
    return 'BookDto(book_id: $book_id, book_name: $book_name, author_name: $author_name, description: $description, language: $language, page_count: $page_count, review_count: $review_count, rating: $rating, image_url: $image_url, category: $category, publisher: $publisher, publish_date: $publish_date, liked: $liked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookDtoImpl &&
            (identical(other.book_id, book_id) || other.book_id == book_id) &&
            (identical(other.book_name, book_name) ||
                other.book_name == book_name) &&
            (identical(other.author_name, author_name) ||
                other.author_name == author_name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.page_count, page_count) ||
                other.page_count == page_count) &&
            (identical(other.review_count, review_count) ||
                other.review_count == review_count) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.publish_date, publish_date) ||
                other.publish_date == publish_date) &&
            (identical(other.liked, liked) || other.liked == liked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      book_id,
      book_name,
      author_name,
      description,
      language,
      page_count,
      review_count,
      rating,
      image_url,
      category,
      publisher,
      publish_date,
      liked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookDtoImplCopyWith<_$BookDtoImpl> get copyWith =>
      __$$BookDtoImplCopyWithImpl<_$BookDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookDtoImplToJson(
      this,
    );
  }
}

abstract class _BookDto extends BookDto {
  const factory _BookDto(
      {required final String book_id,
      required final String book_name,
      required final String author_name,
      required final String description,
      required final String language,
      required final int page_count,
      required final int review_count,
      required final double rating,
      required final String image_url,
      required final String category,
      required final String publisher,
      required final String publish_date,
      final bool liked}) = _$BookDtoImpl;
  const _BookDto._() : super._();

  factory _BookDto.fromJson(Map<String, dynamic> json) = _$BookDtoImpl.fromJson;

  @override // @JsonKey(includeToJson: true) String bookId, // check if this is needed
  String get book_id;
  @override // String user_id,
  String get book_name;
  @override
  String get author_name;
  @override
  String get description;
  @override
  String get language;
  @override
  int get page_count;
  @override
  int get review_count;
  @override
  double get rating;
  @override
  String get image_url;
  @override
  String get category;
  @override
  String get publisher;
  @override
  String get publish_date;
  @override // @ServerTimestampConverter() required FieldValue serverTimestamp,
  bool get liked;
  @override
  @JsonKey(ignore: true)
  _$$BookDtoImplCopyWith<_$BookDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
