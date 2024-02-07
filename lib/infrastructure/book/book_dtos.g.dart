// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookDtoImpl _$$BookDtoImplFromJson(Map<String, dynamic> json) =>
    _$BookDtoImpl(
      bookId: json['bookId'] as String,
      bookName: json['bookName'] as String,
      authorName: json['authorName'] as String,
      description: json['description'] as String,
      language: json['language'] as String,
      pageCount: json['pageCount'] as int,
      reviewCount: json['reviewCount'] as int,
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      liked: json['liked'] as bool? ?? false,
    );

Map<String, dynamic> _$$BookDtoImplToJson(_$BookDtoImpl instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'bookName': instance.bookName,
      'authorName': instance.authorName,
      'description': instance.description,
      'language': instance.language,
      'pageCount': instance.pageCount,
      'reviewCount': instance.reviewCount,
      'rating': instance.rating,
      'imageUrl': instance.imageUrl,
      'liked': instance.liked,
    };
