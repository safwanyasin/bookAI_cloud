// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryDtoImpl _$$StoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$StoryDtoImpl(
      story_id: json['story_id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$StoryDtoImplToJson(_$StoryDtoImpl instance) =>
    <String, dynamic>{
      'story_id': instance.story_id,
      'title': instance.title,
      'content': instance.content,
    };
