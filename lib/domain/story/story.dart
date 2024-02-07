import 'package:book_ai/domain/core/failures.dart';
import 'package:book_ai/domain/story/value_objects.dart';
import 'package:book_ai/domain/core/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';

@freezed
abstract class StoryItem implements _$StoryItem {
  const StoryItem._();

  const factory StoryItem({
    required UniqueId storyId,
    required StoryTitle storyTitle,
    required Content content,
  }) = _StoryItem;

  factory StoryItem.empty() => StoryItem(
        storyId: UniqueId(),
        storyTitle: StoryTitle('Default title'),
        content: Content('some random content'),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return storyTitle.failureOrUnit
        .andThen(content.failureOrUnit)
        .fold((f) => some(f), (_) => none());
  }
}
