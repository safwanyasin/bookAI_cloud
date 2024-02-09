part of 'story_watcher_cubit.dart';

@freezed
class StoryWatcherState with _$StoryWatcherState {
  // const factory StoryWatcherState({
  //   // can add a userdialog over here to show the error messages
  // }) = _StoryWatcherState;

  // const StoryWatcherState._();

  const factory StoryWatcherState.initial() = _Initial;
  const factory StoryWatcherState.loading() = _Loading;
  const factory StoryWatcherState.loadSuccess(List<StoryItem> book) = _LoadSuccess;
  const factory StoryWatcherState.loadFailure(StoryFailure storyFailure) = _LoadFailure;
  
}
