import 'package:book_ai/domain/story/story.dart';
import 'package:book_ai/domain/story/value_objects.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_dtos.freezed.dart';
part 'story_dtos.g.dart';

@freezed
abstract class StoryDto implements _$StoryDto {
  const StoryDto._();

  const factory StoryDto({
    // @JsonKey(includeToJson: true) String bookId, // check if this is needed
    required String storyId,
    required String storyTitle,
    required String content,
  }) = _StoryDto;

  factory StoryDto.fromDomain(StoryItem story) {
    return StoryDto(
      storyId: story.storyId.getOrCrash(),
      storyTitle: story.storyTitle.getOrCrash(),
      content: story.content.getOrCrash(),
    );
  }

  StoryItem toDomain() {
    return StoryItem(
      storyId: UniqueId.fromUniqueString(storyId),
      storyTitle: StoryTitle(storyTitle),
      content: Content(content),
    );
  }

  factory StoryDto.fromJson(Map<String, dynamic> json) =>
      _$StoryDtoFromJson(json);
}
