part of 'story_actor_cubit.dart';

@freezed
class StoryActorState with _$StoryActorState {
  // const factory BookWatcherState({
  //   // can add a userdialog over here to show the error messages
  // }) = _BookWatcherState;

  // const BookWatcherState._();

  const factory StoryActorState.initial() = _Initial;
  const factory StoryActorState.actionInProgress() = _ActionInProgress;
  const factory StoryActorState.deleteFailure(StoryFailure storyFailure) =
      _DeleteFailure;
  const factory StoryActorState.deleteSuccess() = _DeleteSuccess;
}
