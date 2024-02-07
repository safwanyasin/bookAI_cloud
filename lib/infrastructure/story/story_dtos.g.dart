// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryDtoImpl _$$StoryDtoImplFromJson(Map<String, dynamic> json) =>
    _$StoryDtoImpl(
      storyId: json['storyId'] as String,
      storyTitle: json['storyTitle'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$StoryDtoImplToJson(_$StoryDtoImpl instance) =>
    <String, dynamic>{
      'storyId': instance.storyId,
      'storyTitle': instance.storyTitle,
      'content': instance.content,
    };
