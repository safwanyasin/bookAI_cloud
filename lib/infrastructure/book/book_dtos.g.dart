// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookDtoImpl _$$BookDtoImplFromJson(Map<String, dynamic> json) =>
    _$BookDtoImpl(
      book_id: json['book_id'] as String,
      book_name: json['book_name'] as String,
      author_name: json['author_name'] as String,
      description: json['description'] as String,
      language: json['language'] as String,
      page_count: json['page_count'] as int,
      review_count: json['review_count'] as int,
      rating: (json['rating'] as num).toDouble(),
      image_url: json['image_url'] as String,
      category: json['category'] as String,
      publisher: json['publisher'] as String,
      publish_date: json['publish_date'] as String,
      liked: json['liked'] as bool? ?? false,
    );

Map<String, dynamic> _$$BookDtoImplToJson(_$BookDtoImpl instance) =>
    <String, dynamic>{
      'book_id': instance.book_id,
      'book_name': instance.book_name,
      'author_name': instance.author_name,
      'description': instance.description,
      'language': instance.language,
      'page_count': instance.page_count,
      'review_count': instance.review_count,
      'rating': instance.rating,
      'image_url': instance.image_url,
      'category': instance.category,
      'publisher': instance.publisher,
      'publish_date': instance.publish_date,
      'liked': instance.liked,
    };
