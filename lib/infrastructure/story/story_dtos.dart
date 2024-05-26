import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/domain/story/value_objects.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_dtos.freezed.dart';
part 'story_dtos.g.dart';

@freezed
abstract class StoryDto implements _$StoryDto {
  const StoryDto._();

  const factory StoryDto({
    // @JsonKey(includeToJson: true) String bookId, // check if this is needed
    required String story_id,
    required String title,
    required String content,
  }) = _StoryDto;

  factory StoryDto.fromDomain(StoryItem story) {
    return StoryDto(
      story_id: story.storyId.getOrCrash(),
      title: story.storyTitle.getOrCrash(),
      content: story.content.getOrCrash(),
    );
  }

  StoryItem toDomain() {
    return StoryItem(
      storyId: UniqueId.fromUniqueString(story_id),
      storyTitle: StoryTitle(title),
      content: Content(content),
    );
  }

  factory StoryDto.fromJson(Map<String, dynamic> json) =>
      _$StoryDtoFromJson(json);
  factory StoryDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    data['storyId'] = doc.id;
    return StoryDto.fromJson(data);
  }
}
